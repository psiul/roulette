select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 27 and ss.ss_hash <= 777 and c.c_hash >= 351 and c.c_hash <= 684 and hd.hd_hash >= 176 and hd.hd_hash <= 576
;
