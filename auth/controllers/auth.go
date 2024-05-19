package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) Login(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth login"})
	return nil
}

func (o *Service) Authorize(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth authorize"})
	return nil
}

func (o *Service) Refresh(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth refresh"})
	return nil
}

func (o *Service) Logout(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth logout"})
	return nil
}
