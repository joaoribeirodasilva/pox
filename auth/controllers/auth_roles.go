package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) AuthRolesList(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth roles list"})
	return nil
}

func (o *Service) AuthRolesGet(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth roles get"})
	return nil
}

func (o *Service) AuthRolesCreate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth roles create"})
	return nil
}

func (o *Service) AuthRolesUpdate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth roles update"})
	return nil
}

func (o *Service) AuthRolesDelete(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth roles delete"})
	return nil
}
