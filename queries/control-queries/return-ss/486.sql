select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 106 and ss.ss_hash <= 856 and c.c_hash >= 143 and c.c_hash <= 476 and cd.cd_hash >= 85 and cd.cd_hash <= 485
;
