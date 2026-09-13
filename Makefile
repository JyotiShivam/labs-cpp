CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

BUILD_DIR = build

run:
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(FILE) -o $(BUILD_DIR)/program
	./$(BUILD_DIR)/program

clean:
	rm -rf $(BUILD_DIR)