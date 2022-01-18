select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 228 and ss.ss_hash <= 978 and cd.cd_hash >= 300 and cd.cd_hash <= 633 and a.ca_hash >= 482 and a.ca_hash <= 882
;
