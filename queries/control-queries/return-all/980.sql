select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 145 and ss.ss_hash <= 895 and c.c_hash >= 366 and c.c_hash <= 699 and i.i_hash >= 19 and i.i_hash <= 419
;
