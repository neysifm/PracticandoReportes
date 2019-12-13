using BLL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticandoReportes
{
    public partial class Consulta : Page
    {
        List<Usuario> lista = new List<Usuario>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.TextBoxFechaFin.Text = DateTime.Now.ToFormatDate();
                this.TextBoxFechaInicio.Text = DateTime.Now.ToFormatDate();
            }
        }

        protected void filtrarFechaCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (filtrarFechaCheckBox.Checked)
            {
                TextBoxFechaInicio.Enabled = true;
                TextBoxFechaFin.Enabled = true;
            }
            else
            {
                TextBoxFechaInicio.Enabled = false;
                TextBoxFechaFin.Enabled = false;
            }
        }

        protected void BotonBuscar_Click(object sender, EventArgs e)
        {
            SetDataSource(BuscarDatos());
        }

        public void SetDataSource(List<Usuario> listaUsuarios)
        {
            gridviewUsuarios.DataSource = null;
            gridviewUsuarios.DataSource = listaUsuarios;
            lista = listaUsuarios;
            gridviewUsuarios.DataBind();
        }

        public List<Usuario> BuscarDatos()
        {
            int filtroIndex = filtro.SelectedIndex;
            string criterio = criterioTextBox.Text;
            DateTime fechaInicio = TextBoxFechaInicio.Text.ToDatetime();
            DateTime fechaFin = TextBoxFechaFin.Text.ToDatetime();

            Expression<Func<Usuario, bool>> expression = x => true;

            if (filtrarFechaCheckBox.Checked)
            {
                switch (filtroIndex)
                {
                    case 0:
                        expression = x => true && x.Fecha >= fechaInicio && x.Fecha <= fechaInicio;
                        break;
                    case 1:      
                        expression = x => x.UsuarioID == criterio.ToInt() && x.Fecha >= fechaInicio && x.Fecha <= fechaInicio;
                        break;
                    case 2:
                        expression = x => x.Nombre == criterio && x.Fecha >= fechaInicio && x.Fecha <= fechaInicio;
                        break;
                }
            }
            else
            {
                switch (filtroIndex)
                {
                    case 0:
                        expression = x => true;
                        break;
                    case 1:
                        int id = criterio.ToInt();
                        expression = x => x.UsuarioID == id;
                        break;
                    case 2:
                        expression = x => x.Nombre.Contains(criterio);
                        break;
                }
            }

            List<Usuario> listaUsuarios = new RepositorioBase<Usuario>().GetList(expression);
            return listaUsuarios;
        }

        protected void BotonImprimir_Click(object sender, EventArgs e)
        {

        }
    }
}