defmodule ReportsFreelasTest do
  use ExUnit.Case

  alias ReportsFreelas.ReportStub

  describe "build/1" do
    test "should get a complete report" do
      response = ReportsFreelas.build("report_test.csv")

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 12,
          "Daniele" => 21,
          "Danilo" => 7,
          "Diego" => 12,
          "Giuliano" => 14,
          "Jakeliny" => 22,
          "Joseph" => 13,
          "Mayk" => 19,
          "Rafael" => 7,
          "Vinicius" => 0
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 4,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 8,
            "setembro" => 0
          },
          "Daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 1,
            "maio" => 8,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Danilo" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 6,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Diego" => %{
            "abril" => 4,
            "agosto" => 4,
            "dezembro" => 1,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 3
          },
          "Giuliano" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 9,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 4,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 8,
            "junho" => 0,
            "maio" => 0,
            "março" => 14,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Joseph" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 2,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 3,
            "novembro" => 5,
            "outubro" => 0,
            "setembro" => 3
          },
          "Mayk" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 7
          },
          "Rafael" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Vinicius" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_years" => %{
          "Cleiton" => %{"2016" => 3, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 9},
          "Daniele" => %{"2016" => 10, "2017" => 3, "2018" => 7, "2019" => 0, "2020" => 1},
          "Danilo" => %{"2016" => 0, "2017" => 0, "2018" => 1, "2019" => 6, "2020" => 0},
          "Diego" => %{"2016" => 3, "2017" => 8, "2018" => 0, "2019" => 1, "2020" => 0},
          "Giuliano" => %{"2016" => 0, "2017" => 3, "2018" => 0, "2019" => 6, "2020" => 5},
          "Jakeliny" => %{"2016" => 8, "2017" => 8, "2018" => 0, "2019" => 6, "2020" => 0},
          "Joseph" => %{"2016" => 0, "2017" => 3, "2018" => 0, "2019" => 3, "2020" => 7},
          "Mayk" => %{"2016" => 7, "2017" => 8, "2018" => 0, "2019" => 4, "2020" => 0},
          "Rafael" => %{"2016" => 0, "2017" => 7, "2018" => 0, "2019" => 0, "2020" => 0},
          "Vinicius" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
        }
      }

      assert response == expected_response
    end
  end

  describe "build_from_many/1" do
    test "should get a complete report pass a list of reports" do
      response = ReportsFreelas.build_from_many(["report_test.csv", "report_test.csv"])

      expected_response =
        {:ok,
         %{
           "all_hours" => %{
             "Cleiton" => 24,
             "Daniele" => 42,
             "Danilo" => 14,
             "Diego" => 24,
             "Giuliano" => 28,
             "Jakeliny" => 44,
             "Joseph" => 26,
             "Mayk" => 38,
             "Rafael" => 14,
             "Vinicius" => 0
           },
           "hours_per_month" => %{
             "Cleiton" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 8,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 16,
               "setembro" => 0
             },
             "Daniele" => %{
               "abril" => 14,
               "agosto" => 0,
               "dezembro" => 10,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 2,
               "maio" => 16,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Danilo" => %{
               "abril" => 2,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 12,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Diego" => %{
               "abril" => 8,
               "agosto" => 8,
               "dezembro" => 2,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 6
             },
             "Giuliano" => %{
               "abril" => 2,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 18,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 8,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Jakeliny" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 16,
               "junho" => 0,
               "maio" => 0,
               "março" => 28,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Joseph" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 4,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 6,
               "novembro" => 10,
               "outubro" => 0,
               "setembro" => 6
             },
             "Mayk" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 10,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 14,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 14
             },
             "Rafael" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 14,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Vinicius" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             }
           },
           "hours_per_years" => %{
             "Cleiton" => %{"2016" => 6, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 18},
             "Daniele" => %{"2016" => 20, "2017" => 6, "2018" => 14, "2019" => 0, "2020" => 2},
             "Danilo" => %{"2016" => 0, "2017" => 0, "2018" => 2, "2019" => 12, "2020" => 0},
             "Diego" => %{"2016" => 6, "2017" => 16, "2018" => 0, "2019" => 2, "2020" => 0},
             "Giuliano" => %{"2016" => 0, "2017" => 6, "2018" => 0, "2019" => 12, "2020" => 10},
             "Jakeliny" => %{"2016" => 16, "2017" => 16, "2018" => 0, "2019" => 12, "2020" => 0},
             "Joseph" => %{"2016" => 0, "2017" => 6, "2018" => 0, "2019" => 6, "2020" => 14},
             "Mayk" => %{"2016" => 14, "2017" => 16, "2018" => 0, "2019" => 8, "2020" => 0},
             "Rafael" => %{"2016" => 0, "2017" => 14, "2018" => 0, "2019" => 0, "2020" => 0},
             "Vinicius" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
           }
         }}

      assert response == expected_response
    end

    test "should get an error when not pass a list" do
      response = ReportsFreelas.build_from_many("banana")

      expected_response = {:error, "Please provide a list of strings."}

      assert response == expected_response
    end
  end
end
