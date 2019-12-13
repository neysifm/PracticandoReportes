using BLL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticandoReportes
{
    public partial class _RegistroUsuarios : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelFecha.Text = DateTime.Now.Date.ToString("dd/MM/yy");
            this.textboxId.ReadOnly = true;
            if (!IsPostBack)
            {

                ViewState["data"] = new Usuario();
                int id = Request.QueryString["id"].ToInt();
                if (id > 0)
                {
                    RepositorioBase<Usuario> repositorio = new RepositorioBase<Usuario>();
                    Usuario data = repositorio.Buscar(id);
                    if (data == null)
                    {
                        Utilidades.ShowToastr(this, "Usuario no encontrado!", "Advertencia", "warning");
                        return;
                    }

                    LlenaCampos(data);
                    Utilidades.ShowToastr(this, "Usuario Encontrado", "Exito!");
                    textboxId.ReadOnly = true;
                }
            }
            else
            {
                Usuario data = (Usuario)ViewState["data"];
            }
        }

        public Usuario LlenaClase()
        {
            Usuario data = new Usuario
            {
                UsuarioID = textboxId.Text.ToInt(),
                Nombre = textboxNombre.Text,
                Email = textboxEmail.Text,
                Clave = textboxClave.Text,
            };

            return data;
        }

        public void LlenaCampos(Usuario data)
        {
            LabelFecha.Text = DateTime.Now.ToString();
            textboxId.Text = data.UsuarioID.ToString();
            textboxNombre.Text = data.Nombre;
            textboxEmail.Text = data.Email;
            textboxClave.Text = data.Clave;
        }

        protected void buttonBusqueda_Click(object sender, EventArgs e)
        {
            int id = textboxId.Text.ToInt();
            if (id == 0)
            {
                Utilidades.ShowToastr(this, "Debes ingresar los datos de busqueda correctamente", "Advertencia", "warning");
                return;
            }

            Usuario data = new RepositorioBase<Usuario>().Buscar(id);
            if (data == null)
            {
                Utilidades.ShowToastr(this, "No se encontro ninguna data con este id", "Advertencia", "warning");
                return;
            }

            LlenaCampos(data);
            Utilidades.ShowToastr(this, "Usuario Encontrado", "Exito!");
            textboxId.ReadOnly = true;
            return;

        }

        protected void NuevoButton_Click(object sender, EventArgs e)
        {
            Utilidades.ClearControls(formRegistro, new List<Type>() { typeof(TextBox) });
            textboxId.ReadOnly = false;
        }

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            Usuario data = LlenaClase();

            bool paso = true;
            if (data.UsuarioID > 0)
            {
                paso = new RepositorioBase<Usuario>().Modificar(data);
            }
            else
            {
                paso = new RepositorioBase<Usuario>().Guardar(data);
            }
            if (!paso)
            {
                Utilidades.ShowToastr(this, "Error al intentar guardar la data!", "Error", "error");
                return;
            }

            Utilidades.ShowToastr(this, "Registro Guardado Correctamete!", "Exito", "success");
            Utilidades.ClearControls(formRegistro, new List<Type>() { typeof(TextBox) });
            return;
        }

        private bool EsValido(Usuario usuario)
        {

            return true;
        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {
            int id = textboxId.Text.ToInt();
            if (id < 0)
            {
                Utilidades.ShowToastr(this, "Id invalido", "Advertencia", "warning");
                return;
            }
            RepositorioBase<Usuario> repositorio = new RepositorioBase<Usuario>();
            if (repositorio.Buscar(id) == null)
            {
                Utilidades.ShowToastr(this, "Registro no encontrado", "Advertencia", "warning");
                return;
            }

            bool paso = repositorio.Eliminar(id);
            if (!paso)
            {
                Utilidades.ShowToastr(this, "Error al intentar eliminar el registro", "Error", "error");
                return;
            }

            Utilidades.ShowToastr(this, "Registro eliminado correctamente!", "exito", "success");
            return;
        }
    }
}