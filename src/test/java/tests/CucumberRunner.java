package tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CucumberRunner {

    @Test
    void runAllTests() throws Exception {
        Results results = Runner.path("classpath:tests")
                .tags("~@ignore")
                .outputCucumberJson(true)
                .parallel(1);

        generateReport("target/karate-reports");

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    static void generateReport(String jsonFolder) throws Exception {
        List<String> jsonFiles;
        try (Stream<Path> paths = Files.walk(new File(jsonFolder).toPath())) {
            jsonFiles = paths
                    .filter(p -> p.toString().endsWith(".json"))
                    .map(p -> p.toAbsolutePath().toString())
                    .collect(Collectors.toList());
        }

        Configuration config = new Configuration(new File("target"), "Karate API Tests");
        new ReportBuilder(jsonFiles, config).generateReports();
    }
}