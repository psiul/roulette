select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 391 and ss.ss_hash <= 891 and i.i_hash >= 215 and i.i_hash <= 415
;
