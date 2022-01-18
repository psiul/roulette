select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 81 and ss.ss_hash <= 831 and c.c_hash >= 143 and c.c_hash <= 476 and cd.cd_hash >= 223 and cd.cd_hash <= 623
;
