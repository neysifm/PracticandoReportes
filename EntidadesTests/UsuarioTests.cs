using Microsoft.VisualStudio.TestTools.UnitTesting;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;

namespace Entidades.Tests
{
    [TestClass()]
    public class UsuarioTests
    {
        [TestMethod()]
        public void GuardarUsuario()
        {
            RepositorioBase<Usuario> repositorio = new RepositorioBase<Usuario>();

            Usuario usuario = new Usuario
            {
                UsuarioID = 0,
                Nombre = "Neysi",
                Email = "neysi@gmail.com",
                Clave = "1234"
            };

            Assert.IsTrue(repositorio.Guardar(usuario));
        }

        [TestMethod()]
        public void BuscarUsuario()
        {
            Assert.IsNotNull(new RepositorioBase<Usuario>().Buscar(1));
        }

        [TestMethod()]
        public void GetListUsuario()
        {
            Assert.IsTrue(new RepositorioBase<Usuario>().GetList(x => true).Count > 0);
        }

        [TestMethod()]
        public void ModificarUsuario()
        {
            RepositorioBase<Usuario> repositorio = new RepositorioBase<Usuario>();

            Usuario usuario = repositorio.Buscar(1);

            usuario.Nombre = "Maria";
            usuario.Email = "maria@gmail.com";
            usuario.Clave = "345";

            Assert.IsTrue(repositorio.Modificar(usuario));
        }

        [TestMethod()]
        public void EliminarUsuario()
        {
            Assert.IsTrue(new RepositorioBase<Usuario>().Eliminar(1));
        }
    }
}