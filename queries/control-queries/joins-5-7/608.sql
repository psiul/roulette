select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 535 and ss.ss_hash <= 935 and i.i_hash >= 533 and i.i_hash <= 866 and cd.cd_hash >= 31 and cd.cd_hash <= 781
;
