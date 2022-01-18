select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 64 and ss.ss_hash <= 464 and c.c_hash >= 345 and c.c_hash <= 678 and a.ca_hash >= 169 and a.ca_hash <= 919
;
