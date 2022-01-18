select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 565 and ss.ss_hash <= 965 and hd.hd_hash >= 446 and hd.hd_hash <= 779 and i.i_hash >= 181 and i.i_hash <= 931
;
