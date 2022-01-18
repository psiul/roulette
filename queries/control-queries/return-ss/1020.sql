select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 583 and i.i_hash <= 916 and c.c_hash >= 177 and c.c_hash <= 927 and hd.hd_hash >= 422 and hd.hd_hash <= 822
;
