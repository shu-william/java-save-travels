package com.william.travels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.william.travels.models.Expense;
import com.william.travels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	@Autowired
	ExpenseService expenseServ;
	
	@GetMapping("")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseServ.findAllExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Expense> expenses = expenseServ.findAllExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		} else {
			expenseServ.createExpense(expense);
			return "redirect:/expenses";
		}
	}
	@GetMapping("/show/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseServ.findExpense(id);
		model.addAttribute("expense", expense);
		return "show.jsp";
	}
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseServ.findExpense(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("expense", expense);
			return "edit.jsp";
		} else {
			expenseServ.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	@GetMapping("/delete/{id}")
	public String destroy(@PathVariable("id") Long id) {
		expenseServ.deleteExpense(id);
		return "redirect:/expenses";
	}
}
