select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 335 and ss.ss_hash <= 668 and c.c_hash >= 132 and c.c_hash <= 532 and a.ca_hash >= 116 and a.ca_hash <= 866
;
