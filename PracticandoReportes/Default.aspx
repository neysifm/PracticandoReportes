<%@ Page Title="Home Page" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PracticandoReportes._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card  flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
					</div>
					<div class="card-body">
						<div class="card-header text-white h5" style="background-color: rgb(234, 82, 82)">
							<div class="card-title text-center text-uppercase">
								Registro de Usuarios
								<asp:Label CssClass="float-right" runat="server" ID="LabelFecha" Text="11/12/2019"></asp:Label>
							</div>
						</div>

						<asp:Panel ID="formRegistro" runat="server">							
							<hr />
							<div class="form-group">
								<div class="form-group">
								<div class="input-group">								
									<asp:TextBox runat="server" type="number" ReadOnly="false" ID="textboxId" class="form-control" placeholder="ID" autofocus />
									<div class="input-group-append">
										<asp:Button runat="server" Text="Buscar" CssClass="btn btn-primary" formnovalidate OnClick="buttonBusqueda_Click" type="button" />
									</div>
								</div>
							   </div>
                             </div>    

							<div class="form-group">
								<label for="textboxNombre">Nombre</label>
								<asp:TextBox runat="server" type="text" ID="textboxNombre" class="form-control" placeholder="Nombre de Usuario" required />
							</div>

							<div class="form-group">
								<label for="textboxEmail">Email</label>
								<asp:TextBox runat="server" type="text" ID="textboxEmail" class="form-control" placeholder="Correo Electronico" required />
							</div>

							<div class="form-group">
								<label for="textboxClave">Clave</label>
								<asp:TextBox runat="server" type="text" ID="textboxClave" class="form-control" placeholder="Contraseña" required />
							</div>		
							
							<hr />
							<div class="row ">
                            <div class="col-3"></div>
                            <div class="col-6">
                            <asp:Button Text="Nuevo" ID="NuevoButton" formnovalidate OnClick="NuevoButton_Click" runat="server" class="btn btn-lg btn-primary text-uppercase" type="submit" />
							<asp:Button ID="GuardarButton" runat="server" OnClick="GuardarButton_Click" Text="Guardar" class="btn btn-lg btn-success text-uppercase" type="submit" />
							<asp:Button ID="EliminarButton" runat="server" formnovalidate OnClick="EliminarButton_Click" Text="Eliminar" class="btn btn-lg btn-danger text-uppercase" type="submit" />
							<a class="d-block text-center mt-2 small" href="#">Ver Listado</a>
							<hr class="my-4" />
                            </div>
                            <div class="col-3"></div>	
                            </div>

						</asp:Panel>
					</div>
				</div>
			</div>
		</div>
	</div>

</asp:Content>
