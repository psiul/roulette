select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 545 and i.i_hash <= 878 and hd.hd_hash >= 591 and hd.hd_hash <= 991 and d.d_hash >= 33 and d.d_hash <= 783
;
