select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 299 and ss.ss_hash <= 699 and i.i_hash >= 404 and i.i_hash <= 737 and hd.hd_hash >= 44 and hd.hd_hash <= 794
;
