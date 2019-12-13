<%@ Page Title="Home Page" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="RegistroUsuarios.aspx.cs" Inherits="PracticandoReportes._RegistroUsuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- COPIAR DESDE AQUI -->

	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card  flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
					</div>
					<div class="card-body">
						<div class="card-header text-white h5" style="background-color: rgb(50, 116, 211)">
							<div class="card-title text-center text-uppercase">
								Registro de Usuarios
								<asp:Label CssClass="float-right" runat="server" ID="LabelFecha" Text="13/12/2019"></asp:Label>
							</div>
						</div>

						<asp:Panel ID="formRegistro" runat="server">							
							<hr />
							<div class="form-group">
								<div class="input-group">
                                    <!-- ID -->
									<asp:TextBox runat="server" type="number" ReadOnly="false" ID="textboxId" class="form-control" placeholder="ID" autofocus />
									<!-- BOTON BUSCAR -->
                                    <div class="input-group-append">
										<asp:Button runat="server" Text="Buscar" CssClass="btn btn-primary" formnovalidate OnClick="buttonBusqueda_Click" type="button" />
									</div>
								</div>
							</div>						

                            <!-- NOMBRE -->
							<div class="form-group">
								<label for="textboxNombre">Nombre</label>
								<asp:TextBox runat="server" type="text" ID="textboxNombre" MaxLength="60" class="form-control" placeholder="Nombre" required />
							</div>							

                            <!-- EMAIL -->
							<div class="form-group">
								<label for="textboxBalance">Email</label>
								<asp:TextBox runat="server" type="text" ID="textboxEmail" class="form-control" placeholder="Email" required />
							</div>

                            <!-- CLAVE -->
                            <div class="form-group">
								<label for="textboxBalance">Clave</label>
								<asp:TextBox runat="server" type="text" ID="textboxClave" class="form-control" placeholder="Contraseña" required />
							</div>
							<hr />

                            <!-- FECHA -->
                            <div class="form-group">
								<label for="textboxFecha">Fecha</label>
								<asp:TextBox runat="server" type="Date" ID="textbox1" class="form-control" required />
							</div>
							<hr />

                            <!-- BOTONES -->
							<asp:Button formnovalidate Text="Nuevo" ID="NuevoButton" runat="server" OnClick="NuevoButton_Click" class="btn btn-lg btn-secondary text-uppercase" />
							<asp:Button ID="GuardarButton" runat="server" Text="Guardar" OnClick="GuardarButton_Click" class="btn btn-lg btn-success text-uppercase" type="submit" />
							<asp:Button formnovalidate ID="EliminarButton" runat="server" OnClick="EliminarButton_Click" Text="Eliminar" class="btn btn-lg btn-danger text-uppercase" />							
							<hr class="my-4" />

                            <!-- VER LISTADO -->
							<a class="d-block text-center mt-2 small" href="#">Ver Listado</a>
						</asp:Panel>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- COPIAR HASTA AQUI -->
</asp:Content>
