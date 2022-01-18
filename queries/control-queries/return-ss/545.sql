select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 599 and ss.ss_hash <= 999 and cd.cd_hash >= 343 and cd.cd_hash <= 676 and a.ca_hash >= 202 and a.ca_hash <= 952
;
