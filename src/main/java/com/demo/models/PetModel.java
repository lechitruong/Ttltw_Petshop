package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.demo.entities.Catalogs;
import com.demo.entities.Categorys;
import com.demo.entities.Pets;
import com.demo.entities.Users;

import DB.ConnectDB;

public class PetModel {
	// ham lay ra danh sach cac pet
	public List<Pets> findAll() {
		List<Pets> pets = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from pets");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pets pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetType(resultSet.getString("petType"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
				pets.add(pet);

			}
		} catch (Exception e) {
			e.printStackTrace();
			pets = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pets;
	}
	// ham lay ra danh sach pet con trong kho
	public List<Pets> findAllWithPositiveQuantity() {
	    List<Pets> pets = new ArrayList<>();
	    try {
	    	PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT * FROM pets WHERE amount > 0");
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            Pets pet = new Pets();
	            pet.setId(resultSet.getInt("id"));
	            pet.setPetName(resultSet.getString("petName"));
	            pet.setPetType(resultSet.getString("petType"));
	            pet.setPetGender(resultSet.getString("petGender"));
	            pet.setDescription(resultSet.getString("description"));
	            pet.setDetail(resultSet.getString("detail"));
	            pet.setMade(resultSet.getString("made"));
	            pet.setAmount(resultSet.getInt("amount"));
	            pet.setMoney(resultSet.getDouble("money"));
	            pet.setPetBirthday(resultSet.getDate("petBirthday"));
	            pet.setImage(resultSet.getString("image"));
	            pet.setStatus(resultSet.getBoolean("status"));
	            pet.setCategoryId(resultSet.getInt("categoryId"));
	            pet.setCatalogId(resultSet.getInt("catalogId"));
	            pets.add(pet);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        pets = null;
	    } finally {
	        ConnectDB.disconnect();
	    }
	    return pets;
	}
	// ham lay danh sach tat ca pet con trong cua hang
	public List<Pets> findAllExist(boolean status) {
		List<Pets> pets = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from pets where status = ? ");
			preparedStatement.setBoolean(1, status);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pets pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetType(resultSet.getString("petType"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
				pets.add(pet);

			}
		} catch (Exception e) {
			e.printStackTrace();
			pets = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pets;
	}
// tim kiem theo ten hien 5 pet
	public List<Pets> findByName(String keyword) {
		List<Pets> pets = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from pets where petName like ? limit 5");
			preparedStatement.setString(1, "%" + keyword + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pets pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetType(resultSet.getString("petType"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
				pets.add(pet);

			}
		} catch (Exception e) {
			e.printStackTrace();
			pets = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pets;
	}
	public List<Pets> findByKeyword(String keyword) {
        List<Pets> pets = new ArrayList<>();
        try {
        	PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT p.*, c.name AS categoryName, cat.name AS catalogName " +
                           "FROM pets p " +
                           "JOIN categorys c ON p.categoryId = c.id " +
                           "JOIN catalogs cat ON p.catalogId = cat.id " +
                           "WHERE p.petName LIKE ? OR c.name LIKE ? OR cat.name LIKE ?");
            String searchPattern = "%" + keyword + "%";
            preparedStatement.setString(1, searchPattern);
            preparedStatement.setString(2, searchPattern);
            preparedStatement.setString(3, searchPattern);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Pets pet = new Pets();
                pet.setId(resultSet.getInt("id"));
                pet.setPetName(resultSet.getString("petName"));
                pet.setPetType(resultSet.getString("petType"));
                pet.setPetGender(resultSet.getString("petGender"));
                pet.setDescription(resultSet.getString("description"));
                pet.setDetail(resultSet.getString("detail"));
                pet.setMade(resultSet.getString("made"));
                pet.setAmount(resultSet.getInt("amount"));
                pet.setMoney(resultSet.getDouble("money"));
                pet.setPetBirthday(resultSet.getDate("petBirthday"));
                pet.setImage(resultSet.getString("image"));
                pet.setStatus(resultSet.getBoolean("status"));
                pet.setCategoryId(resultSet.getInt("categoryId"));
                pet.setCatalogId(resultSet.getInt("catalogId"));
                pets.add(pet);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pets;
    }


	// ham tim ra pets dua vao id
	public Pets findPetById(int id) {
		Pets pet = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from pets where id = ? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetType(resultSet.getString("petType"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			pet = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pet;
	}

	public List<Pets> findTop10() {
		List<Pets> pets = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from pets order by id desc limit 10");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pets pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
				pets.add(pet);

			}
		} catch (Exception e) {
			e.printStackTrace();
			pets = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pets;
	}

	public int checkExist(int petID, List<Pets> pets) {

		for (int i = 0; i < pets.size(); i++) {
			if (petID == pets.get(i).getId()) {
				return i;
			}
		}
		return -1;
	}

	// ham tra ve danh sach cho cho
	public static List<Pets> findAllByCategory(int categoryId) {
		List<Pets> pets = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from pets where categoryId = ?");
			preparedStatement.setInt(1, categoryId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pets pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
				pets.add(pet);
			}
		} catch (Exception e) {
			e.printStackTrace();
			pets = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pets;
	}

	public List<Pets> findAllByCatalog(int categoryId, int catalogId) {
		List<Pets> pets = new ArrayList<Pets>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from pets where catalogId = ? and categoryId = ?");
			preparedStatement.setInt(1, catalogId);
			preparedStatement.setInt(2, categoryId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pets pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));
				pets.add(pet);
			}
		} catch (Exception e) {
			e.printStackTrace();
			pets = null;
		} finally {
			ConnectDB.disconnect();
		}
		return pets;
	}

	// ham tuoi tho cho pet dua vao ngay sinh
	public String ageByPet(String date) {
		int age = 0;
		String result = "";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate birthdateLocal = LocalDate.parse(date, formatter);
		LocalDate currentDateLocal = LocalDate.now();
		age = (int) ChronoUnit.MONTHS.between(birthdateLocal, currentDateLocal);
		int years = age / 12;
		int months = age % 12;
		if (years == 0) {
			result = months + " tháng";
		} else {
			result = years + " năm " + months + " tháng";
		}
		return result;
	}

	public boolean create(Pets pet) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"insert into pets(petName, petType,petGender,description, detail, made, amount, money, petBirthday, image,status, categoryId, catalogId) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, pet.getPetName());
			preparedStatement.setString(2, pet.getPetType());
			preparedStatement.setString(3, pet.getPetGender());
			preparedStatement.setString(4, pet.getDescription());
			preparedStatement.setString(5, pet.getDetail());
			preparedStatement.setString(6, pet.getMade());
			preparedStatement.setInt(7, pet.getAmount());
			preparedStatement.setDouble(8, pet.getMoney());
			preparedStatement.setDate(9, new java.sql.Date(pet.getPetBirthday().getDate()));
			preparedStatement.setString(10, pet.getImage());
			preparedStatement.setBoolean(11, pet.isStatus());
			preparedStatement.setInt(12, pet.getCategoryId());
			preparedStatement.setInt(13, pet.getCatalogId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

	// ham update
	public boolean update(Pets pet) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"update pets set petName =?, petType=?,petGender=?,description=?, detail=?, made=?, amount=?, money=?, petBirthday=?, image=?,status=?, categoryId=?, catalogId=? where id = ? ");
			preparedStatement.setString(1, pet.getPetName());
			preparedStatement.setString(2, pet.getPetType());
			preparedStatement.setString(3, pet.getPetGender());
			preparedStatement.setString(4, pet.getDescription());
			preparedStatement.setString(5, pet.getDetail());
			preparedStatement.setString(6, pet.getMade());
			preparedStatement.setInt(7, pet.getAmount());
			preparedStatement.setDouble(8, pet.getMoney());
			preparedStatement.setDate(9, new java.sql.Date(pet.getPetBirthday().getTime()));
			preparedStatement.setString(10, pet.getImage());
			preparedStatement.setBoolean(11, pet.isStatus());
			preparedStatement.setInt(12, pet.getCategoryId());
			preparedStatement.setInt(13, pet.getCatalogId());
			preparedStatement.setInt(14, pet.getId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

	// ham xoa user
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("delete from pets where id = ? ");
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}
	public Pets lastPets() {
		Pets pet = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from pets order by id desc limit 1");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				pet = new Pets();
				pet.setId(resultSet.getInt("id"));
				pet.setPetName(resultSet.getString("petName"));
				pet.setPetGender(resultSet.getString("petGender"));
				pet.setDescription(resultSet.getString("description"));
				pet.setDetail(resultSet.getString("detail"));
				pet.setMade(resultSet.getString("made"));
				pet.setAmount(resultSet.getInt("amount"));
				pet.setMoney(resultSet.getDouble("money"));
				pet.setPetBirthday(resultSet.getDate("petBirthday"));
				pet.setImage(resultSet.getString("image"));
				pet.setStatus(resultSet.getBoolean("status"));
				pet.setCategoryId(resultSet.getInt("categoryId"));
				pet.setCatalogId(resultSet.getInt("catalogId"));

			}
		} catch (Exception e) {
			e.printStackTrace();
			pet = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return pet;
	}
	public static void main(String[] args) {
		PetModel petModel = new PetModel();
//			System.out.println(petModel.findTop10());
//			System.out.println(petModel.findPetById(1));
// 		System.out.println(petModel.findAllByCategory(1));
//			System.out.println(userModel.checkLogin("acc2", "123"));
//			System.out.println(BCrypt.checkpw("123", "$2a$10$GQtaPy7y2Q3gsPhA.QlJueoo0wGjy.hNK5/U/GTqqxXMGEjtDnkRi"));
//			System.out.println(BCrypt.hashpw("123", BCrypt.gensalt()));
//			System.out.println(petModel.ageByPet("2003-12-08"));
//			System.out.println(petModel.findAllByCatalog(3, 16));
//			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//			System.out.println(petModel.create(new Pets(1,"test1", "Lớn","Nhỏ","Oke", "Ổn", "Việt Nam", 1, 1.1, new Date(), "pet.png", 3, 4)));
		System.out.println(petModel.lastPets());
	}
}
