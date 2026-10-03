CREATE TABLE IF NOT EXISTS products (
 id BIGSERIAL PRIMARY KEY,
 name TEXT NOT NULL UNIQUE,
 category TEXT NOT NULL DEFAULT 'Outros',
 unit TEXT NOT NULL DEFAULT 'un',
 current_quantity INTEGER NOT NULL DEFAULT 0 CHECK (current_quantity >= 0),
 minimum_quantity INTEGER NOT NULL DEFAULT 0 CHECK (minimum_quantity >= 0),
 ideal_quantity INTEGER NOT NULL DEFAULT 0 CHECK (ideal_quantity >= 0),
 expires_at DATE,
 active BOOLEAN NOT NULL DEFAULT TRUE,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS stock_movements (
 id BIGSERIAL PRIMARY KEY,
 product_id BIGINT NOT NULL REFERENCES products(id),
 kind TEXT NOT NULL CHECK (kind IN ('count','entry','adjustment')),
 previous_quantity INTEGER NOT NULL,
 new_quantity INTEGER NOT NULL,
 expires_at DATE,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS shopping_lists (
 id BIGSERIAL PRIMARY KEY,
 status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open','completed')),
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 completed_at TIMESTAMPTZ
);
CREATE TABLE IF NOT EXISTS shopping_list_items (
 id BIGSERIAL PRIMARY KEY,
 shopping_list_id BIGINT NOT NULL REFERENCES shopping_lists(id) ON DELETE CASCADE,
 product_id BIGINT REFERENCES products(id),
 item_name TEXT NOT NULL,
 quantity INTEGER NOT NULL DEFAULT 1 CHECK (quantity > 0),
 checked BOOLEAN NOT NULL DEFAULT FALSE
);
