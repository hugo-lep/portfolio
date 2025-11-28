print("protegR_load_modules_UIs")
protegR_load_modules_UIs <- function(session,tr){
  req(session$userData$user_info$user_role())
  ns <- session$ns
  role <- session$userData$user_info$user_role()


#  dynamic_dashboard <- list()
  my_dashboard <- list(menu_items = list(), tab_items = list())
  if(TRUE){
    my_dashboard <- add_mod_ui(my_dashboard,tr("menu1_sidebar_type_access"),"Menu1",
                               mod_demo2_ui("demo2",session = session))}
  if(TRUE){
    my_dashboard <- add_mod_ui(my_dashboard,tr("menu2_module_demo"),"Menu2",
                               mod_demo1_ui("demo1", tr))}

  if(TRUE) {my_dashboard <- add_mod_ui(my_dashboard,tr("subItem_test"),my_tabName = NA,ui = NA,
                                        subitems = list(
                                          add_mod_ui_sub(TRUE,tr("subitem1"),my_tabName = "subitem1", ui = mod_demo_subitem1_ui("subitem1")),
                                          add_mod_ui_sub(TRUE,tr("subitem2"),my_tabName = "subitem2", ui = mod_demo_airplane_ui("turn_plane"))
                                        )
                                        )
  }

  #tab item de configuration
  my_dashboard <- add_mod_ui(my_dashboard,tr("configuration"),my_tabName = NA,ui = NA,
                                       subitems = list(
                                         add_mod_ui_sub(TRUE,tr("your_account"),my_tabName = "config_user", ui = mod_config_ui1("config")),
                                         add_mod_ui_sub(role %in% c("admin","super_admin","dev"),
                                                        tr("admin_access"),my_tabName = "config_admin", ui = mod_config_ui2("config")),
                                         add_mod_ui_sub(role %in% c("super_admin","dev"),
                                                        tr("super_admin_access"),my_tabName = "config_super_admin", ui = mod_config_ui3("config")),
                                         add_mod_ui_sub(role == "dev",
                                                        tr("dev_access"),my_tabName = "config_dev", ui = mod_config_ui4("config"))
  )
  )


#  if(TRUE){ my_dashboard <- add_mod_ui(my_dashboard,"Menu 1: type d'accès","Menu1",mod_demo2_ui("menu1"))}
#  if(role == "admin"){ my_dashboard <- add_mod_ui(my_dashboard,"Mon démo admin","admin",mod_demo1_ui("demo",session))}
#  if(TRUE){ my_dashboard <- add_mod_ui(my_dashboard,"Configuration","config",mod_config_ui("config"))}
#add_mod_ui()

#  dynamic_dashboard$sidebar_content <- do.call(sidebarMenu, append(list(id = ns("tabs")), my_dashboard$menu_items))
#  dynamic_dashboard$body_content <- dashboardBody(do.call(tabItems, my_dashboard$tab_items))

  return(my_dashboard)
}
