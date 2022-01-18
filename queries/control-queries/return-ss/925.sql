select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_hash >= 213 and c.c_hash <= 963 and cd.cd_hash >= 159 and cd.cd_hash <= 559 and a.ca_hash >= 540 and a.ca_hash <= 873
;
