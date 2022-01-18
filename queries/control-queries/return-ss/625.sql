select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 202 and ss.ss_hash <= 535 and c.c_hash >= 80 and c.c_hash <= 480 and a.ca_hash >= 234 and a.ca_hash <= 984
;
