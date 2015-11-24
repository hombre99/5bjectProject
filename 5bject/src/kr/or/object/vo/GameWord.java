package kr.or.object.vo;

public class GameWord {
	private int gameNum;
	private int difficulty;
	private String word;

	public GameWord() {
		super();
	}

	public GameWord(int gameNum, int difficulty, String word) {
		super();
		this.gameNum = gameNum;
		this.difficulty = difficulty;
		this.word = word;
	}

	public int getGameNum() {
		return gameNum;
	}

	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "GameWord [gameNum=" + gameNum + ", difficulty=" + difficulty + ", word=" + word + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + difficulty;
		result = prime * result + gameNum;
		result = prime * result + ((word == null) ? 0 : word.hashCode());
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
		GameWord other = (GameWord) obj;
		if (difficulty != other.difficulty)
			return false;
		if (gameNum != other.gameNum)
			return false;
		if (word == null) {
			if (other.word != null)
				return false;
		} else if (!word.equals(other.word))
			return false;
		return true;
	}
}