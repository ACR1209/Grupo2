/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Models.*;
import ModelsDAO.EmployeeDAO;
import ModelsDAO.PersonDAO;
import ModelsDAO.PlaceDAO;
import ModelsDAO.PositionDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres Coronel
 */
public class Control extends HttpServlet {
    
    String search = "views/search.jsp";
    String list = "views/list.jsp";
    String edit = "views/edit.jsp";
    String result = "views/queryResult.jsp";
    String treeView = "views/addPlace.jsp";
    String treeViewEmployee = "views/addEmployee.jsp";
    String addPerson = "views/addPerson.jsp";
    String index = "index.jsp";
    String add = "views/add.jsp";
    String addPosition = "views/addPosition.jsp";
    PersonDAO personDAO = new PersonDAO();
    EmployeeDAO employeeDAO = new EmployeeDAO();
    PlaceDAO placeDAO = new PlaceDAO();
    PositionDAO positionDAO = new PositionDAO();
    Person person = null;
    Employee employee = null;
    Place place = null;
    Position position = null;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String access = "";
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("search")){
            access = search;
        }else if(action.equalsIgnoreCase("list")){
            access = list;
        }else if(action.equalsIgnoreCase("Buscar")){
            String query = request.getParameter("q");
            String option = request.getParameter("opt");
            request.setAttribute("q", query);
            request.setAttribute("opt", option);
            access = result;
        }else if(action.equalsIgnoreCase("addPlace")){

            access = treeView;
        }else if(action.equalsIgnoreCase("add")){
            access = add;
        }else if(action.equalsIgnoreCase("Agregar lugar")){
            placeDAO.add(new Place(0,Integer.parseInt(request.getParameter("parentId")),request.getParameter("desc"), request.getParameter("type")));
            access = treeView;
        }else if(action.equalsIgnoreCase("index")){
            
        }else if(action.equalsIgnoreCase("addEmployee")){
            
            access = treeViewEmployee;
        }else if(action.equalsIgnoreCase("addPerson")){
            
            access = addPerson;
        }else if(action.equalsIgnoreCase("Agregar empleado")){
            employeeDAO.add(new Employee(0, Integer.parseInt(request.getParameter("managerId")), request.getParameter("entryDate"), Integer.parseInt(request.getParameter("idPos")), personDAO.getPersonById(request.getParameter("idPerson")) ));
            access = treeViewEmployee;
        }else if(action.equalsIgnoreCase("Agregar persona")){
            personDAO.add(new Person(request.getParameter("id"),
                    placeDAO.getPlaceById( Integer.parseInt(request.getParameter("idPlace"))), 
                    request.getParameter("ln"), 
                    request.getParameter("fn"), 
                    request.getParameter("dob"), 
                    placeDAO.getPlaceById( Integer.parseInt(request.getParameter("idAddress"))), 
                    request.getParameter("ph"), 
                    request.getParameter("email"), 
                    request.getParameter("g")));
            access = index;
        }else if(action.equalsIgnoreCase("addPosition")){
            access = addPosition;
        }else if(action.equalsIgnoreCase("Agregar cargo")){
            positionDAO.add(new Position(0, request.getParameter("name")));
            access = index;
        }else if(action.equalsIgnoreCase("delete")){
            int option = Integer.parseInt(request.getParameter("opt"));
            
            switch (option) {
                case 1:
                    personDAO.delete(request.getParameter("id"));
                    break;
                case 2:
                    positionDAO.delete(Integer.parseInt(request.getParameter("id")));
                    break;
                case 3:
                    employeeDAO.delete(Integer.parseInt(request.getParameter("id")));
                    break;
                case 4:
                    placeDAO.delete(Integer.parseInt(request.getParameter("id")));
                    break;
                
                default:
                    throw new AssertionError();
            }
            
            access = list;
        }else if(action.equalsIgnoreCase("edit")){
            access = edit;
        }else if(action.equalsIgnoreCase("Editar persona")){
            
            
            personDAO.update(new Person(request.getParameter("id"),
                    placeDAO.getPlaceById( Integer.parseInt(request.getParameter("idP"))), 
                    request.getParameter("ln"), 
                    request.getParameter("fn"), 
                    request.getParameter("dob"), 
                    placeDAO.getPlaceById( Integer.parseInt(request.getParameter("idA"))), 
                    request.getParameter("ph"), 
                    request.getParameter("email"), 
                    request.getParameter("g")));
            access = list;
        }else if(action.equalsIgnoreCase("Editar lugar")){
            
            placeDAO.update(new Place(Integer.parseInt(request.getParameter("id")),
                 Integer.parseInt(request.getParameter("parentId")),
                 request.getParameter("desc"),
                 request.getParameter("type")
            ));
            access = list;
        }else if(action.equalsIgnoreCase("Editar cargo")){
            
            positionDAO.update(new Position(Integer.parseInt(request.getParameter("idPos")), request.getParameter("name")));
            access = list;
        }else if(action.equalsIgnoreCase("Editar empleado")){
            employee = new Employee(Integer.parseInt(request.getParameter("id")),Integer.parseInt(request.getParameter("managerId")) , request.getParameter("entryDate"), Integer.parseInt(request.getParameter("idPos")), personDAO.getPersonById(request.getParameter("idPerson")));
            System.out.println(employee.getEmployeeNumber());
            employeeDAO.update(
                    employee
            );
            access = list;
        }
        
        
        RequestDispatcher view = request.getRequestDispatcher(access);
        if(action.equalsIgnoreCase("Agregar lugar")){
            response.sendRedirect(request.getContextPath() + "/Control?action=addPlace");
        }else if(action.equalsIgnoreCase("Agregar empleado")){
            response.sendRedirect(request.getContextPath() + "/Control?action=addEmployee");
        }else if(action.equalsIgnoreCase("Agregar persona") || action.equalsIgnoreCase("Agregar cargo")){
            response.sendRedirect(request.getContextPath() + "/Control?action=index");
        }else if(action.equalsIgnoreCase("Editar persona") || action.equalsIgnoreCase("Editar cargo") || action.equalsIgnoreCase("Editar empleado") || action.equalsIgnoreCase("Editar lugar") ){
            response.sendRedirect(request.getContextPath() + "/Control?action=list");
        }else{
            view.forward(request, response);

        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
