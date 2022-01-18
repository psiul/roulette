select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 306 and ss.ss_hash <= 506 and hd.hd_hash >= 478 and hd.hd_hash <= 978 and i.i_hash >= 649 and i.i_hash <= 749
;
