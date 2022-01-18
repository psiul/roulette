select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 188 and ss.ss_hash <= 938 and hd.hd_hash >= 503 and hd.hd_hash <= 836 and c.c_hash >= 215 and c.c_hash <= 615
;
