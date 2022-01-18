select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 599 and ss.ss_hash <= 932 and hd.hd_hash >= 144 and hd.hd_hash <= 894 and d.d_hash >= 556 and d.d_hash <= 956
;
