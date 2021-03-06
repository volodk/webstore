public List<AdminsInfo> GetAdminsInfo(Connection connection) {	// Good !! do not close Connection here !!! -> Rule: close a resource at the same place where it was allocated 
	String query = "SELECT AdminName, AdminLastName, AdminLogin, AdminPassword, id_admin, CASE WHEN SuperAdmin IS TRUE THEN '1' ELSE '0' END AS SuperAdmin FROM Admins";
	List<AdminsInfo> results = new ArrayList<>();
	try {
		try (Statement stmt = connection.createStatement()){	// try-with-resource syntax: stmt.close() is called automatically
			try (ResultSet rs = stmt.executeQuery(quer)){		// the same is here
				while (rs.hasNext()){
					AdminsInfo info = new AdminsInfo();
					
					info.setIdAdmin(rs.getInt("id_admin"));
		        		info.setAdminName(rs.getString("AdminName"));
		        		info.setAdminLsatName(rs.getString("AdminLastName"));
		        		info.setAdminLogin(rs.getString("AdminLogin"));
		        		info.setAdminPassword(rs.getString("AdminPassword"));
		        		info.setSuperAdmin(rs.getInt("SuperAdmin"));
		        						
					results.add(info);
				}
			}
		}
	} catch (SQLException e){
		e.printStackTrace();
		return Collections.emptyList();
	}
	return results;
}
