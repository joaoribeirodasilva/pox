package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) AuthSessionsList(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth sessions list"})
	return nil
}

func (o *Service) AuthSessionsGet(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth sessions get"})
	return nil
}

func (o *Service) AuthSessionsCreate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth sessions create"})
	return nil
}

func (o *Service) AuthSessionsUpdate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth sessions update"})
	return nil
}

func (o *Service) AuthSessionsDelete(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth sessions delete"})
	return nil
}
