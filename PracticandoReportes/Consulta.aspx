<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" 
    Inherits="PracticandoReportes.Consulta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	
	 <style type="text/css">
        .bigModal {
            width: 1080px;
            height:800px;
            margin-left: -200px;
        }
    </style>

	<asp:ScriptManager id="scriptmanager1" runat="server"></asp:ScriptManager>	

			<div class="row text-center">
		<h1>Consulta de Usuarios</h1>

             <!-- DROPLIST PARA FILTRAR -->
	        </div>
	        <div class ="row">
		        <div class="col-4">
			     <div class="form-group">
				 <asp:Label Text="Filtro" runat="server" />
				<asp:DropDownList CssClass="form-control" ID="filtro" runat="server">
					<asp:ListItem>Todos</asp:ListItem>
					<asp:ListItem>Cliente Id</asp:ListItem>
					<asp:ListItem>Nombre</asp:ListItem>
				</asp:DropDownList>
			    </div>
		    </div>

        <!-- CRITERIO -->
		<div class="col-4">
			<div class="form-group">
				<asp:Label Text="Criterio" runat="server" />
				<asp:TextBox CssClass="form-control" ID="criterioTextBox" runat="server" placeholder="Criterio"></asp:TextBox>
			</div>
		</div>

        <!-- BOTON BUSCAR -->
		<div class="col-4">
			<div class="form-group">			
				<asp:Button runat="server" OnClick="BotonBuscar_Click" CausesValidation="false" ID="BotonBuscar" CssClass="btn btn-primary" Text="Buscar"/>
			</div>
		</div>
	</div>

    <!-- FILTRO DE FECHA -->
	<div class="row">
		<div class="form-group">
			<asp:CheckBox AutoPostBack="true" CausesValidation="false" Id="filtrarFechaCheckBox" OnCheckedChanged="filtrarFechaCheckBox_CheckedChanged" CssClass="form-control" runat="server" Text="Filtrar Fecha" Checked="false"/>
		</div>
	</div>

    <!-- FECHA INICIO -->
	<div class="row">
		<div class="col-4">
			<div class="form-group">
				<asp:Label Text="Fecha Inicio" runat="server" />
				<asp:TextBox CssClass="form-control" Enabled="false" ID="TextBoxFechaInicio" TextMode="Date" runat="server"></asp:TextBox>
			</div>
		</div>

        <!-- FECHA FIN -->
		<div class="col-4">
			<div class="form-group">
				<asp:Label Text="Fecha Fin" runat="server" />
				<asp:TextBox CssClass="form-control" Enabled="false" ID="TextBoxFechaFin" TextMode="Date" runat="server"></asp:TextBox>
			</div>
		</div>
		<div class="col-4">			
		</div>
	    </div>

	<hr />
	<br />

    <!-- GRID -->
	<asp:UpdatePanel runat="server">
		<ContentTemplate>
	<asp:GridView CssClass="table table-bordered table-responsive" id="gridviewUsuarios" runat="server">
	</asp:GridView>
			</ContentTemplate>
		<Triggers>
        <asp:AsyncPostBackTrigger ControlID="gridviewUsuarios" />
        </Triggers>
	</asp:UpdatePanel>

    <!-- BOTON IMPRIMIR -->
	<asp:Button runat="server" ID="BotonImprimir" CausesValidation="false" OnClick="BotonImprimir_Click" Text="Imprimir" CssClass="btn btn-success"  data-toggle="modal" data-target="#exampleModal3"/>

	<script type="text/javascript">
    function openModal() {
        $('#myModal').modal('show');
    }
    </script>

        <!-- MODAL PARA REPORTE -->

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModal3Label" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content bigModal">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModal3Label">Reporte de Usuarios</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
              </div>
              <div class="modal-footer">       
              </div>
            </div>
          </div>
        </div>		

</asp:Content>