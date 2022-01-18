select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 381 and cd.cd_hash <= 781 and c.c_hash >= 4 and c.c_hash <= 754 and a.ca_hash >= 336 and a.ca_hash <= 669
;
