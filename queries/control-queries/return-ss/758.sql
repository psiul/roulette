select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 218 and ss.ss_hash <= 618 and c.c_hash >= 16 and c.c_hash <= 766 and cd.cd_hash >= 385 and cd.cd_hash <= 718
;
