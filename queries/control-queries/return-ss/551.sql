select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 211 and ss.ss_hash <= 961 and hd.hd_hash >= 332 and hd.hd_hash <= 665 and i.i_hash >= 305 and i.i_hash <= 705
;
