package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) AuthPermissionsList(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth permissions list"})
	return nil
}

func (o *Service) AuthPermissionsGet(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth permissions get"})
	return nil
}

func (o *Service) AuthPermissionsCreate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth permissions create"})
	return nil
}

func (o *Service) AuthPermissionsUpdate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth permissions update"})
	return nil
}

func (o *Service) AuthPermissionsDelete(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth permissions delete"})
	return nil
}
