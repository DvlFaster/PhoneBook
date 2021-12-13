<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PhoneBook.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>PhoneBook</title>

 <%--   <script>
        $(document).ready(function () {
            $('#MybtnModal').click(function () {
                $('#Mymodal').modal('show')
            });
        });
    </script>--%>

    <style>
        .Niceone {
            background-color: whitesmoke;
        }
    </style>

</head>
<body class="Body Niceone" runat="server">



    <form id="form1" runat="server">

        <article class="form-control"></article>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="container">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4">

                                <div class="w3-container">
                                    <div id="id01" class="w3-modal">
                                        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">

                                            <div class="w3-center">
                                                <br />
                                                <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
                                                <img src="avatar.jpg" alt="Avatar" style="width: 30%" class="w3-circle w3-margin-top" />
                                            </div>

                                            <div class="w3-section w3-margin">

                                                <%--<i class="fa fa-id-badge" aria-hidden="true"></i>--%>
                                                <asp:Label ID="ID_Input" runat="server" Text="Enter your ID:" Visible="false"></asp:Label>
                                                <asp:TextBox ID="IDNUM" class="form-control" runat="server" placeholder="Enter your ID here" CommandArgument='<%#Eval("ID") %>' Visible="false"></asp:TextBox>

                                                <div class="form-group">
                                                    <i class="fa fa-user-o" aria-hidden="true"></i>
                                                    <asp:Label ID="FirstName_Input" runat="server" Text="First Name:"></asp:Label>
                                                    <asp:TextBox ID="FirstName" class="form-control w3-input w3-border" runat="server" placeholder="Enter your First Name" CommandArgument='<%#Eval("FirstName") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="FirstNameValidator" runat="server" ControlToValidate="FirstName" ErrorMessage="Enter your FirstName!" ForeColor="Red" ValidationExpression="^([\u0400-\u04FF']{3,100})$|^([a-zA-z ']{3,100})$" Font-Size="Small">Enter your FirstName <i class="fa fa-exclamation-circle" aria-hidden="true"></i></asp:RegularExpressionValidator>
                                                </div>

                                                <div class="form-group">
                                                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                                    <asp:Label ID="SecondName_Input" runat="server" Text="Second Name:"></asp:Label>
                                                    <asp:TextBox ID="SecondName" class="form-control w3-input w3-border" runat="server" placeholder="Enter your Second Name" CommandArgument='<%#Eval("SecondName") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="SecondNameValidator" runat="server" ControlToValidate="SecondName" ErrorMessage="Enter your SecondName!" ForeColor="Red" ValidationExpression="^([\u0400-\u04FF']{3,100})$|^([a-zA-z ']{3,100})$" Font-Size="Small">Enter your SecondName <i class="fa fa-exclamation-triangle" aria-hidden="true"></i></asp:RegularExpressionValidator>
                                                </div>

                                                <div class="form-group">
                                                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                                                    <asp:Label ID="LastName_Input" runat="server" Text="Last Name:"></asp:Label>
                                                    <asp:TextBox ID="LastName" class="form-control w3-input w3-border" runat="server" placeholder="Enter your Last Name" CommandArgument='<%#Eval("LastName") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="LastNameValidator" runat="server" ControlToValidate="LastName" ErrorMessage="Enter your LastName!" ForeColor="Red" ValidationExpression="^([\u0400-\u04FF']{3,100})$|^([a-zA-z ']{3,100})$" Font-Size="Small">Enter your LastName <i class="fa fa-exclamation-circle" aria-hidden="true"></i></asp:RegularExpressionValidator>
                                                </div>

                                                <div class="form-group">
                                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                                    <asp:Label ID="Email_Input" runat="server" Text="E-mail:"></asp:Label>
                                                    <asp:TextBox ID="Email" class="form-control w3-input w3-border" runat="server" placeholder="Enter your email" CommandArgument='<%#Eval("Email") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="EmailValidation" runat="server" ControlToValidate="Email" ErrorMessage="Enter your email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Small">Enter your email address <i class="fa fa-exclamation-triangle" aria-hidden="true"></i></asp:RegularExpressionValidator>
                                                </div>

                                                <div class="form-group">
                                                    <i class="fa fa-phone-square" aria-hidden="true"></i>
                                                    <asp:Label ID="PhoneNumber_Input" runat="server" Text="Phone Number:"></asp:Label>
                                                    <asp:TextBox ID="PhoneNumber" class="form-control w3-input w3-border" runat="server" placeholder="Enter your phone number" CommandArgument='<%#Eval("PhoneNumber") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Please type numbers only!" ForeColor="Red" ValidationExpression="^\d+" Font-Size="Small">Please type numbers only <i class="fa fa-exclamation-circle" aria-hidden="true"></i></asp:RegularExpressionValidator>
                                                </div>

                                                <%--<div class="form-group">
                                                        <i class="fa fa-commenting-o" aria-hidden="true"></i>
                                                        <asp:Label runat="server" for="messageInput">Message:</asp:Label>
                                                        <textarea class="form-control" rows="3" id="messageInput" placeholder="Write your message here"></textarea>
                                                    </div>--%>

                                                <br />


                                                <div class="w3-container w3-border-top w3-padding-16 w3-light-grey w3-border-top">

                                                    <button onclick="document.getElementById('id01').style.display='none'" type="button" class="btn btn-outline-danger" style="margin: 5px;">Cancel</button>
                                                    <asp:Button ID="InsertButton" class="btn btn-outline-success w3-right w3-padding" Style="margin: 5px;" runat="server" Text="Insert" OnClick="BtnInsert_Click" CausesValidation="true" />
                                                    <asp:Button ID="UpdateButton" class="btn btn-outline-warning w3-right w3-padding" Style="margin: 5px;" runat="server" Text="Update" OnClick="BtnUpdate_Click" CausesValidation="true" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br />
                            </div>

                        </div>
                    </div>
                </div>

                <h3 class="w3-center"><i class="fa fa-address-book-o" aria-hidden="true"></i> PhoneBook</h3>

                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">                     
                        <div class="input-group">
                            <asp:TextBox ID="Search" class="form-control" runat="server" placeholder="Search.. "></asp:TextBox>
                            <i class="fa fa-star-o"></i>
                            <div class="input-group-append">
                                <asp:Button ID="SearchButton" class="btn btn-outline-primary" runat="server" Text="Search" OnClick="SearchButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                </br>
                
                <asp:PlaceHolder ID="PlaceHolderHide" runat="server" Visible="false">
                    <asp:Repeater ID="ContactsREP" runat="server">
                        <HeaderTemplate>

                            <table border="1" style="width: 70%;" align="center">
                                <tr>
                                    <th>ID</th>
                                    <th>FirstName</th>
                                    <th>SecondName</th>
                                    <th>LastName</th>
                                    <th>Email</th>
                                    <th>PhoneNumber</th>

                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("ID") %></td>
                                <td><%#Eval("FirstName") %></td>
                                <td><%#Eval("SecondName") %></td>
                                <td><%#Eval("LastName") %></td>
                                <td><%#Eval("Email") %></td>
                                <td><%#Eval("PhoneNumber") %></td>

                                <td>
                                    <asp:LinkButton ID="EditBtn" class="btn btn-outline-primary" runat="server" Text="Edit" OnCommand="Edit_Command" CommandArgument='<%#Eval("ID") %>' CausesValidation="false"></asp:LinkButton>
                                    <asp:Button ID="DeleteBtn" class="btn btn-outline-danger" runat="server" Text="Delete" OnCommand="Delete_Command" CommandArgument='<%#Eval("ID") %>' CausesValidation="false"></asp:Button>

                                </td>
                            </tr>

                        </ItemTemplate>

                        <AlternatingItemTemplate>
                            <tr style="background-color: #cde2ca">
                                <td><%#Eval("ID") %></td>
                                <td><%#Eval("FirstName") %></td>
                                <td><%#Eval("SecondName") %></td>
                                <td><%#Eval("LastName") %></td>
                                <td><%#Eval("Email") %></td>
                                <td><%#Eval("PhoneNumber") %></td>

                                <td>
                                    <asp:LinkButton ID="EditBtn" class="btn btn-primary" runat="server" Text="Edit" OnCommand="Edit_Command" CommandArgument='<%#Eval("ID") %>'></asp:LinkButton>
                                    <asp:Button ID="DeleteBtn" class="btn btn-danger" runat="server" Text="Delete" OnCommand="Delete_Command" CommandArgument='<%#Eval("ID") %>' />
                                </td>
                            </tr>

                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:PlaceHolder>

                <div class="container">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4">

                                <div style="margin-top: 10px;">
                                    <table style="width: 400px;">
                                        <tr align="center">

                                            <td>
                                                <asp:LinkButton ID="lbPrevious" class="btn btn-outline-info" runat="server"
                                                    OnClick="lbPrevious_Click">Previous</asp:LinkButton>
                                            </td>

                                            <td>
                                                <asp:Label ID="PageDisapear" runat="server" Text=""></asp:Label>
                                                <asp:Label ID="TableDisapear" runat="server" class="w3-card-4 w3-hover-red"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:LinkButton ID="lbNext" class="btn btn-outline-info" runat="server"
                                                    OnClick="lbNext_Click">Next</asp:LinkButton>
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">

                    <div style="margin-right: 15px; position: absolute; top: 61%; left: 73%;">
                        <%--<h3>Create/Update</h3>--%>
                        <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-yellow w3-large w3-padding-16"><i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--    <div class="container">
	<h2>Open Bootstrap Modal Popup on Button Click Using jQuery</h2>
	<p>Click below button to open modal popup.</p>	
	<button type="button" id="MybtnModal" class="btn btn-primary">Open Modal Using jQuery</button>
	<!-- .modal -->
	<div class="modal fade" id="Mymodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button> 
					<h4 class="modal-title">Notification</h4>                                                             
				</div> 
				<div class="modal-body">
					Are you sure you want to continue?
				</div>   
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                               
				</div>
			</div>                                                                       
		</div>                                          
	</div>
</div>--%>

</body>

</html>









