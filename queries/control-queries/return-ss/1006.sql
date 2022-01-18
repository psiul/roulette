select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,store_returns sr,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 199 and ss.ss_hash <= 949 and a.ca_hash >= 109 and a.ca_hash <= 509 and cd.cd_hash >= 584 and cd.cd_hash <= 917
;
