package hcmuteshop.controller.admin;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Locale;
import java.util.regex.Pattern;

public class Slugify {
	private static final Pattern NONLATIN = Pattern.compile("[^\\w_-]");
	private static final Pattern SEPARATORS = Pattern.compile("[\\s\\p{Punct}&&[^-]]");

	public static String makeSlug(String input) {
		String noseparators = SEPARATORS.matcher(input).replaceAll("-");
		String normalized = Normalizer.normalize(noseparators, Form.NFD);
		String slug = NONLATIN.matcher(normalized).replaceAll("");
		return slug.toLowerCase(Locale.ENGLISH).replaceAll("-{2,}", "-").replaceAll("^-|-$", "");
	}
}
