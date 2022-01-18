select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 192 and ss.ss_hash <= 942 and hd.hd_hash >= 420 and hd.hd_hash <= 753 and a.ca_hash >= 364 and a.ca_hash <= 764
;
