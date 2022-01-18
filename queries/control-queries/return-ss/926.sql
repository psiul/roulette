select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,store_returns sr,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 36 and ss.ss_hash <= 436 and c.c_hash >= 130 and c.c_hash <= 463 and cd.cd_hash >= 238 and cd.cd_hash <= 988
;
