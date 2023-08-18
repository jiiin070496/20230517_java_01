package semi_project.board.model.dto;


public class AttachFileDto {
	private String filepath;
	private int bno;
	private String fileno;
	
	public AttachFileDto() {
	}
	public AttachFileDto(String filepath) {
		this.filepath = filepath;
	}
	@Override
	public String toString() {
		return "AttachFileDto [filepath=" + filepath + ", bno=" + bno + ", fileno=" + fileno + "]";
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getFileno() {
		return fileno;
	}
	public void setFileno(String fileno) {
		this.fileno = fileno;
	}
	
}
