#!/bin/bash

# Docker Cleanup Therapy - Because your laptop shouldn't look like a digital hoarder's basement

set -e

# Colorful therapy session
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🎭 Welcome to Docker Therapy Session 🎭${NC}"
echo -e "${YELLOW}Let's clean up your digital baggage...${NC}\n"

# Phase 1: Containers - The obvious clutter
if [[ $(docker ps -aq 2>/dev/null | wc -l) -gt 0 ]]; then
    echo -e "${RED}Found $(docker ps -aq | wc -l) abandoned containers${NC}"
    read -p "Terminate these sad, unused containers? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker rm $(docker ps -aq) 2>/dev/null || true
        echo -e "${GREEN}✓ Containers: Sent to the great cloud in the sky${NC}"
    fi
else
    echo -e "${GREEN}✓ No containers found - You're emotionally stable!${NC}"
fi

# Phase 2: Images - The "I might need this someday" hoard
if [[ $(docker images -q 2>/dev/null | wc -l) -gt 0 ]]; then
    echo -e "\n${RED}Found $(docker images -q | wc -l) dusty old images${NC}"
    read -p "Delete these forgotten relics? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker rmi $(docker images -q) 2>/dev/null || true
        echo -e "${GREEN}✓ Images: Digital clutter therapy complete${NC}"
    fi
else
    echo -e "${GREEN}✓ No images found - Minimalist champion!${NC}"
fi

# Phase 3: Volumes - The hidden storage monsters
if [[ $(docker volume ls -q 2>/dev/null | wc -l) -gt 0 ]]; then
    echo -e "\n${RED}Found $(docker volume ls -q | wc -l) lurking volumes${NC}"
    read -p "Exorcise these storage demons? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker volume rm $(docker volume ls -q) 2>/dev/null || true
        echo -e "${GREEN}✓ Volumes: Storage ghosts banished${NC}"
    fi
else
    echo -e "${GREEN}✓ No volumes found - You're practically a Zen master!${NC}"
fi

# Final diagnosis
echo -e "\n${YELLOW}🏆 Therapy Session Complete! 🏆${NC}"
echo "Your Docker environment is now cleaner than your browser history."
echo "(But we won't judge either way)"
