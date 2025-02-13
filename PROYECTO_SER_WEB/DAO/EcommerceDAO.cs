using PROYECTO_SER_WEB.Models;

namespace PROYECTO_SER_WEB.DAO
{
    public class EcommerceDAO
    {

        private string cad_cn;
        public EcommerceDAO(IConfiguration cfg)
        {
            cad_cn = cfg.GetConnectionString("cn1");
        }

        public List<Productos> GetProductos()
        {
            var lista = new List<Productos>();
            //
            var dr =
                SqlHelper.ExecuteReader(cad_cn, "PA_LISTAR_PRODUCTOS");
            //
            while (dr.Read())
            {
                lista.Add(
                    new Productos()
                    {
                        cod_prod = dr.GetString(0),
                        nom_prod = dr.GetString(1),
                        pre_prod = dr.GetDecimal(2),
                        stk_prod = dr.GetInt32(3)
                    });
            }
            dr.Close();
            //
            return lista;
        }

        public Productos BuscarProducto(string codigo)
        {
            var buscado = GetProductos()
                            .Find(p => p.cod_prod.Equals(codigo));

            return buscado;
        }

        public List<Clientes> GetClientes()
        {
            var lista = new List<Clientes>();
            //
            var dr =
                SqlHelper.ExecuteReader(cad_cn, "PA_LISTAR_CLIENTES");
            //
            while (dr.Read())
            {
                lista.Add(new Clientes()
                {
                    cod_cli = dr.GetString(0),
                    nom_cli = dr.GetString(1)
                });
            }
            dr.Close();
            //
            return lista;
        }

        // 07-12-2024
        public string GrabarVentaPanaderia(
            string cod_cli, decimal tot_vta, List<Carrito> lista)
        {
            //grabando en la cabecera: ventas_cab
            string numero = SqlHelper.ExecuteScalar(
                cad_cn, "PA_GRABAR_WEB_VENTAS_CAB", cod_cli, tot_vta).ToString();

            // grabando en el detalle: ventas_deta
            foreach (Carrito item in lista)
            {
                // grabar cada carrito en una fila del detalle
                SqlHelper.ExecuteNonQuery(cad_cn, "PA_GRABAR_WEB_VENTAS_DETA",
                    numero, item.Codigo, item.Cantidad, item.Precio);
            }

            return "Se registró correctamente la venta: " + numero;
        }


    }
}
