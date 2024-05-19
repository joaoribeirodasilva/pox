package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) AuthUsersList(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth users list"})
	return nil
}

func (o *Service) AuthUsersGet(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth users get"})
	return nil
}

func (o *Service) AuthUsersCreate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth users create"})
	return nil
}

func (o *Service) AuthUsersUpdate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth users update"})
	return nil
}

func (o *Service) AuthUsersDelete(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth users delete"})
	return nil
}
