public class ListLearning {
  public static void task1() {
    /*
    1. Initialize a new list that will store text values. Initialize it with the following values: "Apple", "Banana", "Cherry"
      (the task is not about initializing and then adding the values!).
      2. Print the values stored in the list, one by one, in the console.
      3. Add a "Dragonfruit" value to the list.
      4. Use a method to print just the new value in the console (last item of the list).
      5. Run the code in the developer console and filter to only see the printed texts.
       */
    //1
    List<String> fruits = new List<String>{'Apple', 'Banana', 'Cherry'};
    //2
    for(String fruit : fruits) {
      System.debug(fruit);
    }
    //3
    fruits.add('Dragonfruit');
    //4
    System.debug(fruits[fruits.size() - 1]);
  }
  
  public static void task2() {
    /*
    1. Initialize a new list that will store string values and has 3 empty slots.
      2. On index 1 add a new value "Cats".
      3. In a new, 4th slot add a value "Dogs".
      4. Use a method to print the list in one line.
       */
    //1
    List<String> animals = new String[3];
    //2
    animals[1] = 'Cats';
    //3
    animals.add('Dogs');
    //4
    System.debug(animals);
    
  }
  
  public static void task3(){
    /*
    1.	Initialize a variable called "currentMonth" and assign a value between 1 and 12.
      2.	Write a code that will print:
      a.	"It’s winter" if the value is 12, 1 or 2
      b.	"It’s spring" if the value is 3, 4 or 5
      c.	"It’s summer" if the value is 6, 7 or 8
      d.	"It’s autumn" if the value is 9, 10 or 11
      The code can be written with either if/else if statements or with switch statement.
      Write both versions.
      You can use lists to store the possible values for the if/else if version.
      Remember about error handling.
       */
    //1
    Integer currentMonth = Math.floor(Math.random()*12+1).intValue();
    System.debug('Number: ' + currentMonth);
    //2.1
    switch on currentMonth {
      when 12, 1, 2 {
        System.debug('It\'s winter');
      }
      when 3, 4, 5 {
        System.debug('It\'s spring');
      }
      when 6, 7, 8 {
        System.debug('It\'s summer');
      }
      when 9, 10, 11 {
        System.debug('It\'s autumn');
      }
      when else {
        System.debug('Invalid month');
      }
    }
    //2.2
    if(currentMonth == 12 || currentMonth == 1 || currentMonth == 2) {
      System.debug('It\'s winter');
    } else if(currentMonth >= 3 && currentMonth <= 5) {
      System.debug('It\'s spring');
    } else if(currentMonth >= 6 && currentMonth <= 8) {
      System.debug('It\'s summer');
    } else if(currentMonth >= 9 && currentMonth <= 11) {
      System.debug('It\'s autumn');
    } else {
      System.debug('Invalid month');
    }
    //2.3
    List<Integer> winterMonths = new List<Integer>{12, 1, 2};
    List<Integer> springMonths = new List<Integer>{3, 4, 5};
    List<Integer> summerMonths = new List<Integer>{6, 7, 8};
    List<Integer> autumnMonths = new List<Integer>{9, 10, 11};
    List<List<Integer>> yearSeasons = new List<List<Integer>>{winterMonths, springMonths, summerMonths, autumnMonths};
    Boolean found = false;
    for(List<Integer> season : yearSeasons) {
      if(season.contains(currentMonth)) {
        found = true;
        if(season == winterMonths) {
          System.debug('It\'s winter');
        } else if(season == springMonths) {
          System.debug('It\'s spring');
        } else if(season == summerMonths) {
          System.debug('It\'s summer');
        } else if(season == autumnMonths) {
          System.debug('It\'s autumn');
        }
      }
    }
    if(!found) {
      System.debug('Invalid month');
    }
  }
}