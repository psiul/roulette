select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 181 and c.c_hash <= 931 and i.i_hash >= 318 and i.i_hash <= 718 and hd.hd_hash >= 37 and hd.hd_hash <= 370
;
