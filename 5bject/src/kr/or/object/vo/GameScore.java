package kr.or.object.vo;

public class GameScore {
	private String id;
	private int gameNum;
	private int easy;
	private int normal;
	private int hard;

	public GameScore() {
	}

	public GameScore(String id, int gameNum) {
		super();
		this.id = id;
		this.gameNum = gameNum;
	}

	public GameScore(String id, int gameNum, int easy, int normal, int hard) {
		super();
		this.id = id;
		this.gameNum = gameNum;
		this.easy = easy;
		this.normal = normal;
		this.hard = hard;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGameNum() {
		return gameNum;
	}

	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}

	public int getEasy() {
		return easy;
	}

	public void setEasy(int easy) {
		this.easy = easy;
	}

	public int getNormal() {
		return normal;
	}

	public void setNormal(int normal) {
		this.normal = normal;
	}

	public int getHard() {
		return hard;
	}

	public void setHard(int hard) {
		this.hard = hard;
	}

	@Override
	public String toString() {
		return "GameScore [id=" + id + ", gameNum=" + gameNum + ", easy=" + easy + ", normal=" + normal + ", hard="
				+ hard + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + easy;
		result = prime * result + gameNum;
		result = prime * result + hard;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + normal;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GameScore other = (GameScore) obj;
		if (easy != other.easy)
			return false;
		if (gameNum != other.gameNum)
			return false;
		if (hard != other.hard)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (normal != other.normal)
			return false;
		return true;
	}
}